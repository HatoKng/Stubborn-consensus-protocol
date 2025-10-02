# Stubborn-consensus-protocol
This project investigates **robust consensus algorithms** for multi-agent systems, focusing on scenarios with **outliers**.  
We compare two main approaches:

- **Stubborn Consensus**: Converges to the harmonic mean of initial states, effectively rejecting outliers (limited to positive states).
- **Weighted Consensus**: Uses weights inversely proportional to initial conditions, ensuring robustness to outliers even with mixed values, though with slower convergence.

## Features
- Simulation of consensus protocols on different graph topologies (undirected, directed, balanced).
- Comparison with standard consensus under multiple experiments.
- Analysis of convergence speed and robustness against outliers.

## Authors
- Emiliano Paradiso  
- Brian Piccione  
- Vittorio Pisapia  
