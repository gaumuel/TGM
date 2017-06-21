[Mesh]
	type = FileMesh
	file = sphereCave.e
  parallel_type=replicated
	second_order = true
[]

[Variables]
  [./reactionDiff]
		order = SECOND
		family = LAGRANGE
	[../]
[]

[Kernels]
	[./constand_diff]
		type = ConstantDiffusion
		variable = reactionDiff
		constant = 0.5
	[../]
  [./reaction]
		type = Reaction
		variable = reactionDiff
	[../]
	[./time_dev]
		type = ExampleTimeDerivative
		variable = reactionDiff
		time_coefficient = 2.0
	[../]
[]

[BCs]
 [./top]
 type = DirichletBC
 variable = reactionDiff
 boundary = '101'
 value = 0.3
 [../]
 [./bottom]
 type = DirichletBC
 variable = reactionDiff
 boundary = '102'
 value = 0.5
 [../]
 []

[Executioner]
  type = Transient
  solve_type = 'Newton'
	num_steps = 2
  dt = 3
[]

[Outputs]
  execute_on = 'timestep_end'
  exodus = true
[]
