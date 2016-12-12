#ifndef __c3_TST_SATELLITE_h__
#define __c3_TST_SATELLITE_h__

/* Include files */
#include "sfc_sf.h"
#include "sfc_mex.h"
#include "rtwtypes.h"
#include "multiword_types.h"

/* Type Definitions */
#ifndef typedef_SFc3_TST_SATELLITEInstanceStruct
#define typedef_SFc3_TST_SATELLITEInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c3_sfEvent;
  boolean_T c3_isStable;
  boolean_T c3_doneDoubleBufferReInit;
  uint8_T c3_is_active_c3_TST_SATELLITE;
} SFc3_TST_SATELLITEInstanceStruct;

#endif                                 /*typedef_SFc3_TST_SATELLITEInstanceStruct*/

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray *sf_c3_TST_SATELLITE_get_eml_resolved_functions_info(void);

/* Function Definitions */
extern void sf_c3_TST_SATELLITE_get_check_sum(mxArray *plhs[]);
extern void c3_TST_SATELLITE_method_dispatcher(SimStruct *S, int_T method, void *
  data);

#endif
