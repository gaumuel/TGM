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

#ifndef EXPLICITREACTION_H
#define EXPLICITREACTION_H

#include "Kernel.h"

// Forward Declaration
class ExplicitReaction;

template<>
InputParameters validParams<ExplicitReaction>();

class ExplicitReaction : public Kernel
{
public:
  ExplicitReaction(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
	
	/// a = c_3^2L^2k/D
	Real _a;
	//alpha c_2 = alpha c_3, 0 < alpha < 1
	Real _alpha;
	/// Holds the solution at current quadrature points
	const VariableValue & _u_old;


};
#endif //EXPLICITREACTION_H

