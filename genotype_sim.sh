declare -a chr

chr[1]=249
chr[2]=242
chr[3]=198
chr[4]=190
chr[5]=182
chr[6]=171
chr[7]=159
chr[8]=145
chr[9]=138
chr[10]=134
chr[11]=135
chr[12]=133
chr[13]=114
chr[14]=107
chr[15]=102
chr[16]=90
chr[17]=83
chr[18]=80
chr[19]=59
chr[20]=64
chr[21]=47
chr[22]=51

length=${#chr[@]}
echo "Bash array '\${chr}' has total ${length} element(s) (length)"

sample_size=1000
rate=1e-9

for (( j=20; j<=length; j++ ));
do
  printf "chr %d length %s Mb\n" $j "${chr[$j]}"
  out=chr${j}_${sample_size}_rate_${rate}
  if [ -f $out ]; then
	echo "File $out exists, skipping"
  else
  	python simulator.py generate-trees -L ${chr[$j]} -r 1e-9 $sample_size $out
  fi
   if [ -f $out.vcf.gz ]; then
	echo "File $out.vcf.gz exists, skipping"
  else
  	python simulator.py trees-to-vcf $out $out.vcf --contig-id $j
  	gzip -f $out.vcf
  fi
done