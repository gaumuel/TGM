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

#ifndef BDFTIMEDERIVATIVE_H
#define BDFTIMEDERIVATIVE_H

#include "TimeDerivative.h"

// Forward Declarations
class BDFTimeDerivative;

template<>
InputParameters validParams<BDFTimeDerivative>();

class BDFTimeDerivative : public TimeDerivative
{
public:

  BDFTimeDerivative(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;

  virtual Real computeQpJacobian() override;

	const VariableValue & _u_old;

	const VariableValue & _u_older;

	int & _t_step;
};

#endif //BDFTIMEDERIVATIVE_H
