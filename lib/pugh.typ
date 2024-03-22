// Build a pugh matrix
// solutions is an array of strings/content of length n
// criteria is an array of strings/content of length m
// values is a 2d array of length n, each of which is an array of length m
#let pugh(solutions, criteria, values) = {
	// top row is the solutions
	// left column is the criteria
	assert.eq(type(solutions), array)
	assert.eq(type(criteria), array)
	assert(criteria.all(row => type(row) == dictionary))
	assert.eq(type(values), array)
	assert.eq(values.len(), criteria.len())
	assert(values.all(row => row.len() == solutions.len()))

	let criterions = criteria.map(row => row.criterion)
	let weights = criteria.map(row => row.weight)
	let rows = criterions.zip(weights, values)
	let sums = array.range(0, solutions.len()).map(i => values.map(row => row.at(i)).sum() * weights.at(i))

	table(
		columns: solutions.len() + 2,
		[], [Weights], ..solutions,
		..rows.flatten().map(row => [#row]),
		..array.range(0, solutions.len()+2).map(i => []), // spacer row
		[*Score*], [], ..sums.flatten().map(item => [#item])
	)
}
