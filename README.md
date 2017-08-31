Annotate RS ids on a vcf using dbSNP VCF file.

The process

# Instructions

You can set up the reference which will be used by:

a) making a symlink to it called reference:

```
ln -s /path/to/reference.vcf.gz reference
bin/targets | xargs mk
```

c) editing the config.mk file to use your full reference path.

```
$EDITOR config.mk # ando modify REFERENCE acordingly
bin/targets | xargs mk
```

b) using env to indicate the reference:

```
bin/targets | xargs env REFERENCE="/path/to/reference.vcf.gz" mk
```

# Requirements

- bcftools
- tabix
- mk

