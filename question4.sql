select gene_name, (seq_region_end - seq_region_start +1) as lenght from bioinf_examen.gene order by lenght asc limit 1