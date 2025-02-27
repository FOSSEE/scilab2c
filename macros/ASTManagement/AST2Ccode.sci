function AST2Ccode(FileInfoDatFile)
// function AST2Ccode(FileInfoDatFile)
// -----------------------------------------------------------------
// Read the AST and call the corresponding handlers.
//
// Input data:
// //NUT: add description here
//
// Output data:
// //NUT: add description here
//
// Status:
// 11-May-2007 -- Raffaele Nutricato: Author.
// 15-June-2017 -- Ukasha Noor: Revised By
//
// Copyright 2007 Raffaele Nutricato.
// Contact: raffaele.nutricato@tiscali.it
// -----------------------------------------------------------------
// ------------------------------
// --- Check input arguments. ---
// ------------------------------
SCI2CNInArgCheck(argn(2),1,1);


//NUT: questa funzione e' da sistemare meglio

// ---------------------
// --- Load section. ---
// ---------------------
// --- Load File Info Structure. ---
load(FileInfoDatFile,'FileInfo');

// --- Load Shared Info Structure. ---
load(FileInfo.SharedInfoDatFile,'SharedInfo');
// -------------------------
// --- End load section. ---
// -------------------------

// ---------------------------------------------------
// --- Extraction of the function name and number. ---
// ---------------------------------------------------
nxtscifunname   = SharedInfo.NextSCIFunName;
nxtscifunnumber = SharedInfo.NextSCIFunNumber;
ReportFileName  = FileInfo.Funct(nxtscifunnumber).ReportFileName;
SharedInfo.Function_list = [];
SharedInfo.Function_list_index = 1;

// ---------------------------------
// --- Parameter Initialization. ---
// ---------------------------------

global cc_count
cc_count = 0;

global rc_count
rc_count = 0;

global SCI2CSTACK
SCI2CSTACK = ['EMPTYSTACK'];

global StackPosition;
StackPosition = 1;

global STACKDEDUG
STACKDEDUG = 0; // 1 -> Every Pop and Push operation on the stack, the stack content will be printed on screen.

global disp_isthere
disp_isthere = 0;

clear FName
// -------------------------------------
// --- End parameter Initialization. ---
// -------------------------------------

ASTFileName = FileInfo.Funct(nxtscifunnumber).ASTFileName;

// -----------------------
// --- Initialization. ---
// -----------------------
// --- Open AST file. ---
SharedInfo.ASTReader.fidAST = SCI2COpenFileRead(ASTFileName);
fidAST = SharedInfo.ASTReader.fidAST;

OrigWorkAreaUsedBytes = SharedInfo.WorkAreaUsedBytes;
OrigUsedTempScalarVars = SharedInfo.UsedTempScalarVars;

PrintStepInfo('Generate C code in '+FileInfo.Funct(nxtscifunnumber).FinalCFileName,...
   FileInfo.GeneralReport,'both');
// ---------------------------
// --- End initialization. ---
// ---------------------------

// ------------------------
// --- Parse AST header. ---
// ------------------------
ASTHeader  = AST_ReadASTHeader(fidAST,ReportFileName);
SharedInfo = AST_HandleHeader(ASTHeader,FileInfo,SharedInfo);
//NUT: le metto per ora perche' quando provo a cercare lo specifier di precisione al termine
//NUT: del programma non ho piu' nulla da poppare se lo specifier e' assente. Al limite posso mettere la program e i nomi
//NUT: al posto di dummy.
AST_PushASTStack('Dummy');
AST_PushASTStack('Dummy');
AST_PushASTStack('Dummy');
AST_PushASTStack('Dummy');
AST_PushASTStack('Dummy');
AST_PushASTStack('Dummy');
AST_PushASTStack('Dummy');
AST_PushASTStack('Dummy');
//NUT: Se ne tolgo qualcuno ottengo errori
// ----------------------------
// --- End Parse AST header. ---
// ----------------------------
         //NUT: better to have a function.

         // --- Reset TempVars Structure. ---
         TempVars = [];
         // Reset info related to temp variables used in the C code.
         SharedInfo.WorkAreaUsedBytes  = OrigWorkAreaUsedBytes;
         SharedInfo.UsedTempScalarVars = OrigUsedTempScalarVars;
         //NUT: put here a manageeol so that you can have all the save and load you want.
         SharedInfo.ASTReader.UsedTempVars = 0;
// ----------------------------------
// --- Main loop to read the AST. ---
// ----------------------------------
//NUT: file ottenuto con m2sci se hai tempo prova a vedere se ci sono inesattezze.
//NUT: inoltre per maggiore eleganza si puo' pensare di introdurre piu' funzioni

while ~meof(fidAST)
   // Read a line from the AST
   tline = mgetl(fidAST,1);
   AST_CheckLineLength(tline);
   treeline = stripblanks(tline);

   if STACKDEDUG == 1
      disp('Read AST Line: '+treeline);
   end
   // Analyze line.
   select treeline

      // ------------------
      // --- Functions. ---
      // ------------------
      //NUT: qui puoi anche aggiunger piu' case per specificare meglio la struttura della funcall
      //NUT: i case aggiunti ovviamente faranno solo il push della treeline.
      case 'EndOperation' then
         [disp_isthere,FileInfo,SharedInfo] = AST_HandleEndGenFun(disp_isthere,FileInfo,SharedInfo,'Operation');
      case 'EndFuncall' then
	 if rc_count > 0 & cc_count == 0
		[EqualInArgName,EqualInArgScope,EqualNInArg,FName] = AST_HandleFuncArray(FileInfo,SharedInfo);
	elseif cc_count > 0
		[EqualInArgName,EqualInArgScope,EqualNInArg,FName] = AST_HandleFuncArray2D(FileInfo,SharedInfo);
	else
         [disp_isthere,FileInfo,SharedInfo] = AST_HandleEndGenFun(disp_isthere,FileInfo,SharedInfo,'Funcall');
	end
      // --------------
      // --- Equal. ---
      // --------------
      case 'EndEqual' then
      //NUT: prima di lanciare l'analisi della equal puoi mettere degli argomenti dummy
      //NUT: per fare in modo di coprire le ins, anche se ci puo' essere qualche rischio quando
      //NUT: ho miste ins e variabili, per esempio [c(1,1), a] = twooutfun();
      //NUT: in questo caso solo una delle due equal va scartata.
 	 if rc_count > 0 & cc_count == 0
		[FileInfo,SharedInfo] = AST_HandleFunRC(FName,FileInfo,SharedInfo);
		rc_count = 0;
	 elseif cc_count > 0
		[FileInfo,SharedInfo] = AST_HandleFunCC(FName,cc_count,FileInfo,SharedInfo);
		rc_count = 0;
                cc_count = 0;
	 else
		if disp_isthere == 0
         	[disp_isthere,FileInfo,SharedInfo] = AST_HandleEndGenFun(disp_isthere,FileInfo,SharedInfo,'Equal');
         	SharedInfo = INIT_SharedInfoEqual(SharedInfo);
		end
	 end
	 disp_isthere = 0;
         clear FName
      case 'Equal' then
         SharedInfo.Equal.Enabled = 1; // 1 means enabled -> we are inside an equal AST block.
         AST_PushASTStack(treeline);
      case 'Lhs       :' then
		if rc_count > 0 & cc_count == 0
		SharedInfo.Equal.Lhs = 1;
		[EqualInArgName,EqualInArgScope,EqualNInArg] = AST_HandleRC(FileInfo,SharedInfo);
		SharedInfo.Equal.NInArg = EqualNInArg - rc_count -1;
		AST_PushASTStack(treeline);
		for tmpcnt = 1:SharedInfo.Equal.NInArg
	           SharedInfo.Equal.InArg(tmpcnt).Name = EqualInArgName(tmpcnt);
	           SharedInfo.Equal.InArg(tmpcnt).Scope = EqualInArgScope(tmpcnt);
         	end
		elseif cc_count > 0
		SharedInfo.Equal.Lhs = 1;
 		[EqualInArgName,EqualInArgScope,EqualNInArg] = AST_HandleCC(FileInfo,SharedInfo);
                AST_PushASTStack(treeline);
		else
	        SharedInfo.Equal.Lhs = 1; // 1 means that we are inside the Lhs block of the Equal
	 	//if SharedInfo.Equal.NOutArg > 0
                if disp_isthere == 0
	        [EqualInArgName,EqualInArgScope,EqualNInArg] = AST_ReadEqualRhsNames(FileInfo,SharedInfo);
		SharedInfo.Equal.NInArg = EqualNInArg;
		//end
     
	        // lengthNumber = length('Number_');
	        // if (part(EqualInArgScope,1:lengthNumber) == 'Number_')
	        //    SharedInfo.SkipNextEqual = 1
	        // end
	         
	        for tmpcnt = 1:SharedInfo.Equal.NInArg
	           SharedInfo.Equal.InArg(tmpcnt).Name = EqualInArgName(tmpcnt);
	           SharedInfo.Equal.InArg(tmpcnt).Scope = EqualInArgScope(tmpcnt);
         	end
	 	//end
                end
         	AST_PushASTStack(treeline);
		end
      // ----------------
      // --- If/Else. ---
      // ----------------
      //NUT: da verificare la gestione dello stack
      case 'If Statements' then
         [FileInfo,SharedInfo] = AST_HandleIfElse(FileInfo,SharedInfo,'if');
      case 'Else If Expression' then
         AST_PushASTStack(treeline);
         [FileInfo,SharedInfo] = AST_HandleIfElse(FileInfo,SharedInfo,'else');
      case 'Else If Statements' then
         [FileInfo,SharedInfo] = AST_HandleIfElse(FileInfo,SharedInfo,'elseif');
      case 'Else Statements' then
         [FileInfo,SharedInfo] = AST_HandleIfElse(FileInfo,SharedInfo,'else');
      case 'EndIf' then
         for counter=1:SharedInfo.CountNestedIf+1
            SharedInfo = C_IfElseBlocks(FileInfo,SharedInfo,'out');
         end
         SharedInfo.CountNestedIf = 0;
      // --------------
      // --- Dummy. ---
      // --------------
      case 'Comment :' then
         AST_HandleEOL(FileInfo,SharedInfo); //NUT: si potrebbe differenziare comment da EOL
      case '<EOL>' then
         AST_HandleEOL(FileInfo,SharedInfo);

      // -----------------
      // --- Epilogue. ---
      // -----------------
      case 'EndProgram'
         SharedInfo = AST_HandleEndProgram(FileInfo,SharedInfo);
	 disp_isthere = 0;
         //NUT: per essere precisi si puo' pensare di mettere un check
         //NUT: alla fine dell'albero per accertarsi che c'e' end program li' dove ce lo aspettiamo
      // ------------
      // --- For. ---
      // ------------
      case 'For' then
         SharedInfo.For.Level = SharedInfo.For.Level + 1;
         FileInfo = AST_HandleFor(FileInfo,SharedInfo);
      case 'ForExpression:'
         AST_PushASTStack(treeline);
         SharedInfo.ForExpr.OnExec = SharedInfo.ForExpr.OnExec + 1;
      case 'ForStatements:'
         [FileInfo,SharedInfo] = AST_HandleForStatem(FileInfo,SharedInfo);
      case 'EndFor' then
         SharedInfo = AST_HandleEndFor(FileInfo,SharedInfo);
         SharedInfo.For.Level = SharedInfo.For.Level - 1;

      // --------------
      // --- While. ---
      // --------------
      case 'While' then
         AST_PushASTStack(treeline);
         SharedInfo.While.Level = SharedInfo.While.Level + 1;
      case 'WhileExpression:'
         AST_PushASTStack(treeline);
         [FileInfo,SharedInfo] = AST_HandleWhileExpr(FileInfo,SharedInfo);
      case 'WhileStatements:'
         [FileInfo,SharedInfo] = AST_HandleWhileStatem(FileInfo,SharedInfo);
      case 'EndWhile' then
         SharedInfo = AST_HandleEndWhile(FileInfo,SharedInfo);
         SharedInfo.While.Level = SharedInfo.While.Level - 1;


      case 'Endrc' then
	 rc_count = rc_count + 1;
      
      case 'Endcc' then
	 cc_count = cc_count + 1;
	
         //[FileInfo,SharedInfo] = AST_HandleRC(FileInfo,SharedInfo);

      // ----------------
      // --- Default. ---
      // ----------------
      else
         AST_PushASTStack(treeline);
   end
end
// ------------------------------------
// -----List of functions Used--------
// -------------------------------------

SharedInfo.Function_list_index = SharedInfo.Function_list_index - 2;
SharedInfo.Function_list = SharedInfo.Function_list(1:SharedInfo.Function_list_index);
//To remove function repeatedly used----------
x = size(unique(SharedInfo.Function_list));                          
SharedInfo.Function_list_index = x(1);
SharedInfo.Function_list = unique(SharedInfo.Function_list);

SharedInfo.Function_list = SharedInfo.Function_list(1:SharedInfo.Function_list_index);



// --------------------------------------
// --- End main loop to read the AST. ---
// --------------------------------------

mclose(fidAST);
// ---------------------
// --- Save section. ---
// ---------------------
// --- Save Shared Info Structure. ---
save(SharedInfoDatFile, "SharedInfo");
// -------------------------
// --- End save section. ---
// -------------------------
endfunction
