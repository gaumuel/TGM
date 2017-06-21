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

#include "ConstantDiffusion.h"


template<>
InputParameters validParams<ConstantDiffusion>()
{
  // Start with the parameters from our parent
  InputParameters params = validParams<ExampleDiffusion>();

  // Now add any extra parameters this class needs:

  // Add a required parameter.  If this isn't provided in the input file MOOSE will error.
  params.addRequiredParam<Real>("constant", "The constant (K) ");

  return params;
}


ConstantDiffusion::ConstantDiffusion(const InputParameters & parameters) :
    ExampleDiffusion(parameters),

    // Get the parameters from the input file
    _constant(getParam<Real>("constant"))
{
}

ConstantDiffusion::~ConstantDiffusion()
{
}

Real
ConstantDiffusion::computeQpResidual()
{
  // K/mu * grad_u * grad_phi[i]
  return (_constant) * ExampleDiffusion::computeQpResidual();
}

Real
ConstantDiffusion::computeQpJacobian()
{
  // K/mu * grad_phi[j] * grad_phi[i]
  return (_constant) * ExampleDiffusion::computeQpJacobian();
}
