mkdir -p ../build
python3 ./split-hex.py \
--from-hex ../rom/promh.mcr.9.hex --from-hex-width 48 \
--from-size 512 --from-width 48 \
--reverse --includes-parity \
--to-size 512 --to-width 8 \
--to-prefix prom0 \
--out-dir ../build

diff -q ../build/prom0.0.0.hex ../doc/promh.9/promh9.1e17.hex
diff -q ../build/prom0.1.0.hex ../doc/promh.9/promh9.1e19.hex
diff -q ../build/prom0.2.0.hex ../doc/promh.9/promh9.1d16.hex
diff -q ../build/prom0.3.0.hex ../doc/promh.9/promh9.1c20.hex
diff -q ../build/prom0.4.0.hex ../doc/promh.9/promh9.1b17.hex
diff -q ../build/prom0.5.0.hex ../doc/promh.9/promh9.1b19.hex