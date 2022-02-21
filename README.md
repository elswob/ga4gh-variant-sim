# ga4gh-variant-sim
Simulations for benchmarking large-scale variant stores

The Python code for running simulations and conversion to VCF is in the ``simulator.py`` 
script in this directory.

Code for running specific benchmarks and comparisons across different formats is 
in the ``data`` directory.

```
#create trees for sample size of 1 million (10**6)
python simulator.py generate-trees -p 6 p6

#create trees for sample size of 5 million 
python simulator.py generate-trees 5000000 5M

# convert to tsinfer zarr
python simulator.py trees-to-tsinfer-zarr p6 p6-tsinfer-zarr

# convert to sgkit zarr
python simulator.py trees-to-sgkit-zarr p6 p6-sgkit-zarr

# convert to vcf
python simulator.py trees-to-vcf p6 p6.vcf
gzip p6.vcf
```

### Genotype sims

Create VCF file with 1000 samples, chr22 length (51Mb) and simulation mutation rate of 1e-9

```
python simulator.py generate-trees -L 51 -r 1e-9 1000 chr22_1000_rate_e9
python simulator.py trees-to-vcf chr22_1000_rate_e9 chr22_1000_rate_e9.vcf --contig-id 22
gzip chr22_1000_rate_e9.vcf.gz
```