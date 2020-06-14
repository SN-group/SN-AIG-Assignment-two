import random
using IJulia

function knapsack(value, weight, capacity)
    #Return the maximum value of items that doesn't exceed capacity.
    #value[i] is the value of item i and weight[i] is the weight of item i
    #for 1 <= i <= n where n is the number of items.

    capacity is the maximum weight.
    #n = len(value) - 1

    # m[i][w] will store the maximum value that can be attained with a maximum
    # capacity of w and using only the first i items
    #m = [[-1]*(capacity + 1) for _ in range(n + 1)]


    function knapsack_helper(value, weight, m, i, w)
    #Return maximum value of first i items attainable with weight <= w.

    #m[i][w] will store the maximum value that can be attained with a maximum
    #capacity of w and using only the first i items
    #This function fills m as smaller subproblems needed to compute m[i][w] are    solved.

    #value[i] is the value of item i and weight[i] is the weight of item i
    #for 1 <= i <= n where n is the number of items.

    if m[i][w] >= 0
        return m[i][w]

    if i == 0
        q = 0
    else if weight[i] <= w
        q = max(knapsack_helper(value, weight,
                m, i - 1 , w - weight[i])
            + value[i],
        knapsack_helper(value, weight,
            m, i - 1 , w))
    else
        q = knapsack_helper(value, weight,
            m, i - 1 , w)
        m[i][w] = q

    return q

    for w in range(capacity + 1)
        m[0][w] = 0

    for i in range(1, n + 1)
        for w in range(capacity + 1)
            if weight[i] > w
                m[i][w] = m[i - 1][w]
            else
                m[i][w] = max(m[i - 1][w - weight[i]] + value[i],
                              m[i - 1][w])

    return m[n][capacity]

    # Hill climbing algorithm
    function hill_climbing(m[i][w]:[][], weight:int, initial_state:State, max_iterations:int, mutation_rate:float=0.01)

        # Keep track of the best state
        best_state = initial_state

        # An iterator can be used to give the algorithm more time to find a solution
        iterator = 0

        # Create an infinite loop
        while True

            # Mutate the best state
            neighbor = mutate(m[i][w], weight, best_state, mutation_rate)

            # Check if the weight is less than in the best state
            if(neighbor.weight =< best_state.weight)
                iterator += 1
            if (iterator > max_iterations)
                break
            if(neighbor.weight < best_state.weight)
                best_state = neighbor

        # Return the best state
        return best_state

function main()

n = int(input('Enter number of items: '))
value = input('Enter the values of the {} item(s) in order: '
              .format(n)).split()
value = [int(v) for v in value]
value.insert(0, None) # so that the value of the ith item is at value[i]
weight = input('Enter the positive weights of the {} item(s) in order: '
               .format(n)).split()
weight = [int(w) for w in weight]
weight.insert(0, None) # so that the weight of the ith item is at weight[i]
capacity = int(input('Enter maximum weight: '))

ans = knapsack(value, weight, capacity)
println('The maximum value of items that can be carried:', ans)



# Run hill climbing to find a better solution
    knapsack = get_best_solution_by_weight(m[i][w], weihgt)
    knapsack = hill_climbing(m[i][w], weight, knapsack, capacity, 0.1)
    print('-- Hill climbing solution --')
    print(value[weight], end='')
    for i in range(0, join(knapsack.weight))
        print(' -> ' + value[knapsack.weight[i]], end='')
        print(' -> ' + value[weight], end='')
        print('\n\nTotal weight: {0} kg'.format(knapsack.weight))
        print()
end
main()
