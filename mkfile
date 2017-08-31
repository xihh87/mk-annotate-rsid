< config.mk

# clean up early annotations
#
results/%.noids.vcf:	data/%.vcf
	bcftools annotate \
		--output 'results/'$stem'.build.noids.vcf' \
		--output-type z \
		--remove ID \
		$prereq \
	&& mv 'results/'$stem'.build.noids.vcf' $target \
	&& tabix -p vcf $target

# add rs id to variants
#
results/%.vcf.gz:	results/%.noids.vcf
	bcftools annotate \
		--annotations "$REFERENCE" \
		--columns ID \
		--output 'results/'$stem'.build.vcf' \
		--output-type z \
		$prereq \
	&& mv 'results/'$stem'.build.vcf' $target \
	&& tabix -p vcf $target
