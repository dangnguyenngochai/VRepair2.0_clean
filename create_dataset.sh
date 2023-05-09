# Set up environment as needed
source env.sh
cd fine_tune_data/big_vul

# Extract token data from C source files
python ../../src/extract.py commits > extract.out 2>&1

# Generate src/tgt raw files from tokenized data
python ../../src/gensrctgt.py commits 3 -meta commits_metadata.csv > gensrctgt.out 2>&1

# Create random split on data
python ../../src/process_fine_tune_data.py --src_file=SrcTgt/commits.src.txt --tgt_file=SrcTgt/commits.tgt.txt --meta_file=SrcTgt/commits.meta.txt --max_src_length=1000 --max_tgt_length=100 --generate_random --is_big_vul --output_dir=. > process.out 2>&1