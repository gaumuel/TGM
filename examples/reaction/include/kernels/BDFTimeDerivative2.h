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

#ifndef BDFTimeDerivative2_H
#define BDFTimeDerivative2_H

#include "TimeDerivative.h"

// Forward Declarations
class BDFTimeDerivative2;

template<>
InputParameters validParams<BDFTimeDerivative2>();

class BDFTimeDerivative2 : public TimeDerivative
{
public:

  BDFTimeDerivative2(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;

  virtual Real computeQpJacobian() override;

	const VariableValue & _u_old;

	const VariableValue & _u_older;

	int & _t_step;
	
	Real time_derivative;
	
	VariableValue _u_old_older;

	const VariableValue & _v;
};

#endif //BDFTimeDerivative2_H
