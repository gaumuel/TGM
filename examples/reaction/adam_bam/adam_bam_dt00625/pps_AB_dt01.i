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
 
[Functions]
[./initial_condition_funct]
 type = ParsedFunction
 value = '0.7*exp(-x^2)'
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
 [../]
[./reaction]
 type = LinearABReaction
 variable = reactionDiff
 a = 1
 alpha = 0.1
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
 num_steps = 3200
 dt = 0.00625
 []
 
 
[Outputs]
 exodus = true
 xda = true
 []
