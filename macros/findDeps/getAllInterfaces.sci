//
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2009-2009 - DIGITEO - Bruno JOFRET
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
//
//

function allInterfaces = getAllInterfaces(SharedInfo)
      Target = SharedInfo.Target;
  //Interface files common to all types of output format
  Standalone_interfaces = [
      "src/c/auxiliaryFunctions/interfaces/int_rand.h"
      "src/c/auxiliaryFunctions/interfaces/int_sign.h"
      "src/c/auxiliaryFunctions/interfaces/int_size.h"
      "src/c/auxiliaryFunctions/interfaces/int_length.h"
      "src/c/auxiliaryFunctions/interfaces/int_type.h"
      "src/c/auxiliaryFunctions/interfaces/int_isempty.h"
      "src/c/auxiliaryFunctions/interfaces/int_isnan.h"
      "src/c/auxiliaryFunctions/interfaces/int_pythag.h"
      "src/c/auxiliaryFunctions/interfaces/int_frexp.h"
      "src/c/auxiliaryFunctions/interfaces/int_abs.h"
      "src/c/auxiliaryFunctions/interfaces/int_max.h"
      "src/c/auxiliaryFunctions/interfaces/int_min.h"
      "src/c/auxiliaryFunctions/interfaces/int_conj.h"
      "src/c/auxiliaryFunctions/interfaces/int_find.h"
      "src/c/type/int_imag.h"
      "src/c/type/int_real.h"
      "src/c/matrixOperations/interfaces/int_vmagn.h"
      "src/c/matrixOperations/interfaces/int_ones.h"
      "src/c/matrixOperations/interfaces/int_cat.h"
      "src/c/matrixOperations/interfaces/int_zeros.h"
      "src/c/matrixOperations/interfaces/int_OpBackSlash.h"
      "src/c/matrixOperations/interfaces/int_OpApex.h"
      "src/c/matrixOperations/interfaces/int_OpCc.h"
      "src/c/matrixOperations/interfaces/int_OpRc.h"
      "src/c/matrixOperations/interfaces/int_transpose.h"
      "src/c/matrixOperations/interfaces/int_v2magn.h"
      "src/c/matrixOperations/interfaces/int_invert.h"
      "src/c/matrixOperations/interfaces/int_OpSlash.h"
      "src/c/matrixOperations/interfaces/int_OpDotApex.h"
      "src/c/matrixOperations/interfaces/int_trace.h"
      "src/c/matrixOperations/interfaces/int_det.h"
      "src/c/matrixOperations/interfaces/int_eye.h"
      "src/c/matrixOperations/interfaces/int_OpStar.h"
      "src/c/matrixOperations/interfaces/int_chol.h"
      "src/c/matrixOperations/interfaces/int_dist.h"
      "src/c/matrixOperations/interfaces/int_fill.h"
      "src/c/matrixOperations/interfaces/int_expm.h"
      "src/c/matrixOperations/interfaces/int_diag.h"
      "src/c/matrixOperations/interfaces/int_cumsum.h"
      "src/c/matrixOperations/interfaces/int_matrix.h"
      "src/c/matrixOperations/interfaces/int_nnz.h"
      "src/c/matrixOperations/interfaces/int_pertrans.h"
      "src/c/matrixOperations/interfaces/int_cumprod.h"
      "src/c/matrixOperations/interfaces/int_triu.h"
      "src/c/matrixOperations/interfaces/int_tril.h"
      "src/c/matrixOperations/interfaces/int_kron.h"
      "src/c/matrixOperations/interfaces/int_flipdim.h"
      "src/c/matrixOperations/interfaces/int_permute.h"
      "src/c/matrixOperations/interfaces/int_norm.h"
      "src/c/matrixOperations/interfaces/int_toeplitz.h"
      "src/c/matrixOperations/interfaces/int_cross.h"
      "src/c/matrixOperations/interfaces/int_ndgrid.h"
      "src/c/interpolation/interfaces/int_interp1.h"
      "src/c/elementaryFunctions/interfaces/int_nextpow2.h"
      "src/c/elementaryFunctions/interfaces/int_gcd.h"
      "src/c/elementaryFunctions/interfaces/int_isreal.h"
      "src/c/elementaryFunctions/interfaces/int_asinh.h"
      "src/c/elementaryFunctions/interfaces/int_atanh.h"
      "src/c/elementaryFunctions/interfaces/int_sinh.h"
      "src/c/elementaryFunctions/interfaces/int_tanh.h"
      "src/c/elementaryFunctions/interfaces/int_sqrt.h"
      "src/c/elementaryFunctions/interfaces/int_OpDotHat.h"
      "src/c/elementaryFunctions/interfaces/int_OpHat.h"
      "src/c/elementaryFunctions/interfaces/int_lnp1m1.h"
      "src/c/elementaryFunctions/interfaces/int_round.h"
      "src/c/elementaryFunctions/interfaces/int_log10.h"
      "src/c/elementaryFunctions/interfaces/int_log2.h"
      "src/c/elementaryFunctions/interfaces/int_log1p.h"
      "src/c/elementaryFunctions/interfaces/int_floor.h"
      "src/c/elementaryFunctions/interfaces/int_exp10.h"
      "src/c/elementaryFunctions/interfaces/int_cos.h"
      "src/c/elementaryFunctions/interfaces/int_fix.h"
      "src/c/elementaryFunctions/interfaces/int_exp.h"
      "src/c/elementaryFunctions/interfaces/int_int.h"
      "src/c/elementaryFunctions/interfaces/int_log.h"
      "src/c/elementaryFunctions/interfaces/int_pow.h"
      "src/c/elementaryFunctions/interfaces/int_sin.h"
      "src/c/elementaryFunctions/interfaces/int_sind.h"
      "src/c/elementaryFunctions/interfaces/int_tan.h"
      "src/c/elementaryFunctions/interfaces/int_tand.h"
      "src/c/elementaryFunctions/interfaces/int_acosh.h"
      "src/c/elementaryFunctions/interfaces/int_acos.h"
      "src/c/elementaryFunctions/interfaces/int_asin.h"
      "src/c/elementaryFunctions/interfaces/int_atan.h"
      "src/c/elementaryFunctions/interfaces/int_ceil.h"
      "src/c/elementaryFunctions/interfaces/int_bitand.h"
      "src/c/elementaryFunctions/interfaces/int_bitor.h"
      "src/c/elementaryFunctions/interfaces/int_bitxor.h"
      "src/c/elementaryFunctions/interfaces/int_bitcmp.h"
      "src/c/elementaryFunctions/interfaces/int_bitset.h"
      "src/c/elementaryFunctions/interfaces/int_bitget.h"
      "src/c/elementaryFunctions/interfaces/int_linspace.h"
      "src/c/elementaryFunctions/interfaces/int_isrow.h" 
      "src/c/elementaryFunctions/interfaces/int_nthroot.h"
      "src/c/elementaryFunctions/interfaces/int_pmodulo.h"
      "src/c/elementaryFunctions/interfaces/int_nanmax.h"
      "src/c/elementaryFunctions/interfaces/int_nanmean.h"
      "src/c/elementaryFunctions/interfaces/int_nanmin.h"
      "src/c/elementaryFunctions/interfaces/int_nansum.h"
      "src/c/elementaryFunctions/interfaces/int_nancumsum.h"
      "src/c/elementaryFunctions/interfaces/int_issquare.h"
      "src/c/elementaryFunctions/interfaces/int_isscalar.h"
      "src/c/elementaryFunctions/interfaces/int_isvector.h"
      "src/c/elementaryFunctions/interfaces/int_iscolumn.h"
      "src/c/elementaryFunctions/interfaces/int_ismatrix.h"
      "src/c/elementaryFunctions/interfaces/int_logspace.h"
      "src/c/elementaryFunctions/interfaces/int_cosh.h"
      "src/c/elementaryFunctions/interfaces/int_uint8.h"
      "src/c/elementaryFunctions/interfaces/int_int8.h"
      "src/c/elementaryFunctions/interfaces/int_uint16.h"
      "src/c/elementaryFunctions/interfaces/int_int16.h"
      "src/c/elementaryFunctions/interfaces/int_uint32.h"
      "src/c/elementaryFunctions/interfaces/int_int32.h"
      "src/c/elementaryFunctions/interfaces/int_acosd.h"
      "src/c/elementaryFunctions/interfaces/int_acot.h"
      "src/c/elementaryFunctions/interfaces/int_acotd.h"
      "src/c/elementaryFunctions/interfaces/int_acoth.h"
      "src/c/elementaryFunctions/interfaces/int_acsc.h"
      "src/c/elementaryFunctions/interfaces/int_acscd.h"
      "src/c/elementaryFunctions/interfaces/int_acsch.h"
      "src/c/elementaryFunctions/interfaces/int_asec.h"
      "src/c/elementaryFunctions/interfaces/int_asecd.h"
      "src/c/elementaryFunctions/interfaces/int_asech.h"
      "src/c/elementaryFunctions/interfaces/int_asind.h"
      "src/c/elementaryFunctions/interfaces/int_atand.h"
      "src/c/elementaryFunctions/interfaces/int_gcd.h"
      "src/c/elementaryFunctions/interfaces/int_lcm.h"
      "src/c/elementaryFunctions/interfaces/int_isequal.h"
      "src/c/elementaryFunctions/interfaces/int_isinf.h"
      "src/c/graphics/transforms/interfaces/int_scaling.h"
      "src/c/statisticsFunctions/interfaces/int_mean.h"
      "src/c/statisticsFunctions/interfaces/int_median.h"
      "src/c/statisticsFunctions/interfaces/int_mvcorrel.h"
      "src/c/statisticsFunctions/interfaces/int_nanmedian.h"
      "src/c/statisticsFunctions/interfaces/int_strange.h"
      "src/c/statisticsFunctions/interfaces/int_gsort.h"
      "src/c/statisticsFunctions/interfaces/int_nanstdev.h"
      "src/c/statisticsFunctions/interfaces/int_mad.h"
      "src/c/statisticsFunctions/interfaces/int_meanf.h"
      "src/c/statisticsFunctions/interfaces/int_stdevf.h"
      "src/c/statisticsFunctions/interfaces/int_stdev.h"
      "src/c/statisticsFunctions/interfaces/int_prod.h"
      "src/c/statisticsFunctions/interfaces/int_variance.h"
      "src/c/statisticsFunctions/interfaces/int_sum.h"
      "src/c/statisticsFunctions/interfaces/int_moment.h"
      "src/c/statisticsFunctions/interfaces/int_wcenter.h"
      "src/c/statisticsFunctions/interfaces/int_center.h"
      "src/c/statisticsFunctions/interfaces/int_correl.h"
      "src/c/statisticsFunctions/interfaces/int_covar.h"
      "src/c/operations/interfaces/int_OpEqual.h"
      "src/c/operations/interfaces/int_OpLogNot.h"
      "src/c/operations/interfaces/int_OpLogEq.h"
      "src/c/operations/interfaces/int_OpLogNe.h"
      "src/c/operations/interfaces/int_OpLogGt.h"
      "src/c/operations/interfaces/int_OpLogGe.h"
      "src/c/operations/interfaces/int_OpLogLt.h"
      "src/c/operations/interfaces/int_OpLogLe.h"
      "src/c/operations/interfaces/int_OpLogAnd.h"
      "src/c/operations/interfaces/int_OpLogOr.h"
      "src/c/operations/interfaces/int_OpDotStar.h"
      "src/c/operations/interfaces/int_OpDotSlash.h"
      "src/c/operations/interfaces/int_OpBackSlash.h"
      "src/c/operations/interfaces/int_OpDotBackSlash.h"
      "src/c/operations/interfaces/int_OpSlash.h"
      "src/c/operations/interfaces/int_OpPlus.h"
      "src/c/operations/interfaces/int_OpMinus.h"
      "src/c/operations/interfaces/int_OpStar.h"
      "src/c/operations/interfaces/int_OpExt.h"
      "src/c/operations/interfaces/int_OpIns.h"
      "src/c/string/interfaces/int_disp.h"
      "src/c/string/interfaces/int_string.h"
      "src/c/signalProcessing/interfaces/int_modk.h"
      "src/c/signalProcessing/interfaces/int_hank.h"
      "src/c/signalProcessing/interfaces/int_idct.h"
      "src/c/signalProcessing/interfaces/int_dct.h"
      "src/c/signalProcessing/interfaces/int_ifft.h"
      "src/c/signalProcessing/interfaces/int_lpc2cep.h"
      "src/c/signalProcessing/interfaces/int_cepstrum.h"
      "src/c/signalProcessing/interfaces/int_xcorr.h"
      "src/c/signalProcessing/interfaces/int_convol.h"
      "src/c/signalProcessing/interfaces/int_hilbert.h"
      "src/c/signalProcessing/interfaces/int_levin.h"
      "src/c/signalProcessing/interfaces/int_fftshift.h"
      "src/c/signalProcessing/interfaces/int_fft.h"
      "src/c/signalProcessing/interfaces/int_lev.h"
      "src/c/signalProcessing/interfaces/int_zpbutt.h"
      "src/c/signalProcessing/interfaces/int_zpch1.h"
      "src/c/signalProcessing/interfaces/int_zpch2.h"
      "src/c/signalProcessing/interfaces/int_buttmag.h"
      "src/c/signalProcessing/interfaces/int_kalm.h"
      "src/c/signalProcessing/interfaces/int_faurre.h"
      "src/c/signalProcessing/interfaces/int_cheb1mag.h"
      "src/c/signalProcessing/interfaces/int_cheb2mag.h"
      "src/c/signalProcessing/interfaces/int_sincd.h"
      "src/c/signalProcessing/interfaces/int_fsfirlin.h"
      "src/c/signalProcessing/interfaces/int_modk.h"
      "src/c/signalProcessing/interfaces/int_filt_sinc.h"
      "src/c/signalProcessing/interfaces/int_ffilt.h"
      "src/c/signalProcessing/interfaces/int_modsn.h"
      "src/c/signalProcessing/interfaces/int_ell1mag.h"
      "src/c/signalProcessing/interfaces/int_amell.h"
      "src/c/implicitList/int_OpColon.h"
      "src/c/differential_calculus/interfaces/int_ode.h"
      "src/c/differential_calculus/interfaces/int_diffc.h"
      "src/c/Files/interfaces/int_files.h"
      "src/c/string/interfaces/int_convstr.h"
	"src/c/string/interfaces/int_strsubst.h"
	//"src/c/string/interfaces/int_strcmp.h"
	"src/c/string/interfaces/int_strrev.h"
	"src/c/string/interfaces/int_strrchr.h"
	"src/c/string/interfaces/int_strchr.h"
	"src/c/string/interfaces/int_ascii.h"
	"src/c/string/interfaces/int_strspn.h"
	"src/c/string/interfaces/int_strcspn.h"
	"src/c/string/interfaces/int_strncpy.h"
	"src/c/elementaryFunctions/interfaces/int_dec2base.h"
	"src/c/elementaryFunctions/interfaces/int_base2dec.h"
	"src/c/elementaryFunctions/interfaces/int_dec2bin.h"
	"src/c/elementaryFunctions/interfaces/int_dec2hex.h"
	"src/c/elementaryFunctions/interfaces/int_dec2oct.h"
	"src/c/elementaryFunctions/interfaces/int_oct2dec.h"
	"src/c/elementaryFunctions/interfaces/int_hex2dec.h"
	"src/c/elementaryFunctions/interfaces/int_bin2dec.h"
	"src/c/elementaryFunctions/interfaces/int_cosd.h"
	"src/c/elementaryFunctions/interfaces/int_cotd.h"
	"src/c/elementaryFunctions/interfaces/int_coth.h"
	"src/c/elementaryFunctions/interfaces/int_csc.h"
	"src/c/elementaryFunctions/interfaces/int_cscd.h"
	"src/c/elementaryFunctions/interfaces/int_csch.h"
	"src/c/elementaryFunctions/interfaces/int_sec.h"
	"src/c/elementaryFunctions/interfaces/int_secd.h"
	"src/c/elementaryFunctions/interfaces/int_sech.h"
	"src/c/elementaryFunctions/interfaces/int_float.h"
	"src/c/elementaryFunctions/interfaces/int_factorial.h"
	"src/c/elementaryFunctions/interfaces/int_primes.h"
	"src/c/elementaryFunctions/interfaces/int_factor.h"
	"src/c/elementaryFunctions/interfaces/int_sinc.h"
	"src/c/specialFunctions/interfaces/int_erf.h"
	"src/c/specialFunctions/interfaces/int_erfc.h"
	"src/c/specialFunctions/interfaces/int_erfcx.h"
	"src/c/specialFunctions/interfaces/int_erfinv.h"
	"src/c/specialFunctions/interfaces/int_calerf.h"
	"src/c/specialFunctions/interfaces/int_gamma.h"
	"src/c/specialFunctions/interfaces/int_gammaln.h"
	"src/c/specialFunctions/interfaces/int_beta.h"
	"src/c/specialFunctions/interfaces/int_besseli.h"
	"src/c/specialFunctions/interfaces/int_besselj.h"
	"src/c/specialFunctions/interfaces/int_besselk.h"
	"src/c/specialFunctions/interfaces/int_bessely.h"
      "src/c/CACSD/interfaces/int_syslin.h"
      "src/c/CACSD/interfaces/int_lqr.h"
      "src/c/CACSD/interfaces/int_lqe.h"
      "src/c/CACSD/interfaces/int_obscont.h"
	  "src/c/linearAlgebra/interfaces/int_spec.h"
      "src/c/linearAlgebra/interfaces/int_schur.h"
      "src/c/linearAlgebra/interfaces/int_balanc.h"
      "src/c/linearAlgebra/interfaces/int_svd.h"
      "src/c/linearAlgebra/interfaces/int_lu.h"
      "src/c/linearAlgebra/interfaces/int_rank.h"
	  "src/c/linearAlgebra/interfaces/int_sqroot.h"
	  "src/c/linearAlgebra/interfaces/int_hess.h"
	  "src/c/linearAlgebra/interfaces/int_sva.h"
	  "src/c/linearAlgebra/interfaces/int_givens.h"	
	  "src/c/linearAlgebra/interfaces/int_householder.h"
	  "src/c/linearAlgebra/interfaces/int_fullrf.h"	
	  "src/c/linearAlgebra/interfaces/int_rowcomp.h"	
	  "src/c/linearAlgebra/interfaces/int_range.h"	
	  "src/c/linearAlgebra/interfaces/int_qr.h";
      "src/c/linearAlgebra/interfaces/int_rcond.h"];


  //Interface files required for "Arduino" output
  Arduino_interfaces = [
      "src/c/scilab-arduino/interfaces/int_cmd_digital_out.h"
      "src/c/scilab-arduino/interfaces/int_cmd_digital_in.h"
      "src/c/scilab-arduino/interfaces/int_cmd_analog_out.h"
      "src/c/scilab-arduino/interfaces/int_cmd_analog_in.h"
      "src/c/scilab-arduino/interfaces/int_cmd_dcmotor.h"
      "src/c/scilab-arduino/interfaces/int_cmd_servo.h"
      "src/c/scilab-arduino/interfaces/int_sleep.h"
      "src/c/scilab-arduino/interfaces/int_cmd_analog_in_volt.h"
      "src/c/scilab-arduino/interfaces/int_cmd_analog_out_volt.h"
      "src/c/scilab-arduino/interfaces/int_cmd_i2c_dev.h"
      "src/c/scilab-arduino/interfaces/int_cmd_i2c_write.h"
      "src/c/scilab-arduino/interfaces/int_cmd_i2c_read.h"
      "src/c/scilab-arduino/interfaces/int_cmd_i2c_write_register.h"
      "src/c/scilab-arduino/interfaces/int_cmd_i2c_read_register.h"];

  //Interface files required for "AVR" output
  AVR_interfaces = [
      "src/c/hardware/avr/interfaces/int_AVRPeripheralGPIO.h"
      "src/c/hardware/avr/interfaces/int_AVRPeripheralADC.h"
      "src/c/hardware/avr/interfaces/int_AVRPeripheralPWM.h"
      "src/c/hardware/avr/interfaces/int_AVRUtil.h"
      "src/c/hardware/avr/interfaces/int_AVRPeripheralTimer.h"
      "src/c/hardware/avr/interfaces/int_AVRPeripheralUART.h"
	];

  RPI_interfaces = [
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralDigital.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralGertboard.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralI2C.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralInterrupt.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralLCD.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralLCD128x64.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralMcp.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralMisc.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralPcf.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralPiGlow.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralPinMap.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralPWM.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralSerial.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralSetup.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralShift.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralSoft.h"
      "src/c/hardware/rasberrypi/interfaces/int_RPIPeripheralTiming.h"
        ];

  OpenCV_interfaces = [
      "src/c/imageProcessing/interfaces/int_cvcore.hpp"
      "src/c/imageProcessing/interfaces/int_cvhighgui.hpp"
      "src/c/imageProcessing/interfaces/int_cvimgproc.hpp"];

  if Target == "StandAlone"
  allInterfaces = Standalone_interfaces;
  elseif Target == "Arduino"
  allInterfaces = cat(1,Standalone_interfaces, Arduino_interfaces);
  elseif Target == "AVR"
  allInterfaces = cat(1,Standalone_interfaces, AVR_interfaces);
  elseif Target == "RPi"
  allInterfaces = cat(1,Standalone_interfaces, RPI_interfaces);
  end

  if (SharedInfo.OpenCVUsed == %T)
      allInterfaces = cat(1,allInterfaces,OpenCV_interfaces)
  end

endfunction
