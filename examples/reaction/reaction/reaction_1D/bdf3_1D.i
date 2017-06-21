[Mesh]
 type = GeneratedMesh
 dim = 1
 xmin = -20
 xmax = 20
 nx = 1500
 []
 
 
[Variables]
[./reactionDiff]
 order = FIRST
 family = LAGRANGE
 [../]
 []
 
[AuxVariables]
 [./nodal_aux]
 order = FIRST
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
 type = Diffusion
 variable = reactionDiff
 [../]
[./reaction]
 type = ExampleReaction
 variable = reactionDiff
 a = 1
 alpha = 0.1
 [../]
[./time_dev]
 type = BDFTimeDerivative3
 variable = reactionDiff
 v = nodal_aux
 [../]
 []
 
 [AuxKernels]
 [./nodal_bdf3]
 type = Sbdf3Aux
 variable = nodal_aux
 coupled = reactionDiff
 execute_on = 'timestep_end'
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
 
 
 
[Preconditioning]
 active = 'FDP'
 [./FDP]
 type = SMP
 full = true
 [../]
 []
 
[Executioner]
 type = Transient
 solve_type = Newton
 num_steps = 40
 dt = 1
 []
 
[Outputs]
 execute_on = 'timestep_end'
 exodus = true
 xda = true
 []
