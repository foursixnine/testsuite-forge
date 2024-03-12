set -e
rm qrencode.img || echo "no need for cleanup"
gcc -o qrencode qrencode.c -lqrencode
./qrencode |& tee qrencode.img
file qrencode.img
# md5sum qrencode.img this sum cannot fail
echo "31d1daeffdb0efa67f2800b04758f26d qrencode.img" | md5sum -c 
