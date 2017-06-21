[Mesh]
 type = GeneratedMesh
 dim = 2
 ymin = 0
 ymax = 1
 xmin = -20
 xmax = 20
 nx = 400
 elem_type = QUAD8
 []
 
 
[Variables]
[./reactionDiff]
 order = SECOND
 family = LAGRANGE
 [../]
 []
 
 [UserObjects]
 [./fine_solution]
# Read in the fine grid solution
 type = SolutionUserObject
 system_variables = reactionDiff
 mesh = adam_out_3200_mesh.xda
 es = adam_out_3200.xda
 [../]
 []
 
[Functions]
[./initial_condition_funct]
 type = ParsedFunction
 value = '0.7*exp(-x^2)'
 [../]
 
 [./fine_function]
# Create a Function out of the fine grid solution
# Note: This references the SolutionUserObject above
 type = SolutionFunction
 solution = fine_solution
 [../]
 
 []
 
[ICs]
[./u_ic]
 type = FunctionIC
 variable = reactionDiff
 function = initial_condition_funct
 [../]
 []
 
[Kernels]
[./constant_diff]
 type = CNDiffusion
 variable = reactionDiff
  epsilon = 1
 lambda = 1
 nu = 1
 [../]
[./reaction]
 type = LinearABReaction
 variable = reactionDiff
 a = 1
 alpha = 0.1
   epsilon = 1
 lambda = 1
 nu = 1
 [../]
[./time_dev]
 type = TimeDerivative
 variable = reactionDiff
 [../]
 []
 
[BCs]
 
[./left]
 type = DirichletBC
 variable = reactionDiff
 boundary = left
 value = 0
 [../]
 
[./right]
 type = DirichletBC
 variable = reactionDiff
 boundary = right
 value = 0
 [../]
 []
 
 
[Executioner]
 type = Transient
 solve_type = Newton
 num_steps = 800
 dt = 0.025
 []
 
 [Postprocessors]
 [./error]
# Compute the error between the computed solution and the fine-grid solution
 type = ElementL2Error
 variable = reactionDiff
 function = fine_function
 [../]
 []
 
[Outputs]
 exodus = true
 csv = true
 []
