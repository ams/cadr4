mkdir -p ../build
python3 ./split-hex.py \
--from-hex ../rom/promh.mcr.9.hex --from-hex-width 48 \
--from-size 512 --from-width 48 \
--reverse --includes-parity \
--to-size 512 --to-width 8 \
--to-prefix prom0 \
--out-dir ../build

diff -q ../build/prom0.0.0.hex ../doc/promh.9/promh9.1e17.hex || exit 1
diff -q ../build/prom0.8.0.hex ../doc/promh.9/promh9.1e19.hex || exit 1
diff -q ../build/prom0.16.0.hex ../doc/promh.9/promh9.1d16.hex || exit 1
diff -q ../build/prom0.24.0.hex ../doc/promh.9/promh9.1c20.hex || exit 1
diff -q ../build/prom0.32.0.hex ../doc/promh.9/promh9.1b17.hex || exit 1
diff -q ../build/prom0.40.0.hex ../doc/promh.9/promh9.1b19.hex || exit 1

mkdir -p ../build
python3 ./split-hex.py \
--from-hex ../rom/mmem.hex --from-hex-width 32 \
--from-size 32 --from-width 32 \
--reverse --add-parity \
--to-size 32 --to-width 2 \
--to-prefix mmem \
--out-dir ../build