#!/bin/bash

# Clone the Loomy repository
git clone https://github.com/benjg1337/Loomy.git
cd Loomy

# Set executable permission for loomy.sh
chmod +x loomy.sh

# Run loomy.sh
./loomy.sh

# Optionally, clean up by removing the cloned directory if needed
# cd ..
# rm -rf Loomy
