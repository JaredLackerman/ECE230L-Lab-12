# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Name Ashley Johnson and Jared Lackerman 

## Summary
With K-map provided we used it to create the current state bits and input 'w'. The first thing we need was encode the One Hot and assigned a unique bit to each state. Then encoded the binary with a minimum of 3 flip-flops needed and assigned binary numbers to states. For each state, we listed the next state based on 'w' input values. Then recorded the output 'z' for each state. With the table provided we used that to up us set up the pin assignments for the board.  
## Lab Questions

### Compare and contrast One Hot and Binary encodings
One Hot encoding is easier to design and debug due to simpler logic but requires more hardware resources, especially as the number of states grows. While Binary encoding is more hardware efficient but is often required a more complex combinational logic and careful handling of invalid states.
### Which method did your team find easier, and why?
We found that the One Hot was easier because each state corresponds directly to one flip flop, so our combinational logic only needs to detect single bits rather than decode multiple bits.
### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
Use One-Hot when you want a simpler design, faster timing, and have sufficient flip-flop. Use Binary when flip-flop resources are constrained, or the FSM has many states, and you can manage the added logic complexity.
