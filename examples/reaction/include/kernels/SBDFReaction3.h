/****************************************************************/
/*               DO NOT MODIFY THIS HEADER                      */
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*           (c) 2010 Battelle Energy Alliance, LLC             */
/*                   ALL RIGHTS RESERVED                        */
/*                                                              */
/*          Prepared by Battelle Energy Alliance, LLC           */
/*            Under Contract No. DE-AC07-05ID14517              */
/*            With the U. S. Department of Energy               */
/*                                                              */
/*            See COPYRIGHT for full restrictions               */
/****************************************************************/

#ifndef SBDFREACTION3_H
#define SBDFREACTION3_H

#include "Kernel.h"
#include "FEProblem.h"

// Forward Declaration
class SBDFReaction3;

template<>
InputParameters validParams<SBDFReaction3>();

class SBDFReaction3 : public Kernel
{
public:
  SBDFReaction3(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
	
	/// a = c_3^2L^2k/D
	Real _a;
	//alpha c_2 = alpha c_3, 0 < alpha < 1
	Real _alpha;
	/// Holds the solution at current quadrature points
	const VariableValue & _u_old;
	const VariableValue & _u_older;
	int & _t_step;
	Real _resF_old;
	Real _resF_older;
	Real _resF_old_older;
	
	VariableValue _u_old_older;
	const VariableValue & _v;

};
#endif //SBDFREACTION3_H

