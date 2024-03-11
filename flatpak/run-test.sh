set -e
rm -rf PED-7568/build
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Script needs to find the latest platform runtime 
flatpak --user install -y flathub org.flatpak.Builder runtime/org.freedesktop.Platform/$(uname -p)/23.08
flatpak-builder PED-7568/build PED-7568/org.flatpak.Hello.yml 
flatpak-builder --user --install --force-clean PED-7568/build PED-7568/org.flatpak.Hello.yml
flatpak run org.flatpak.Hello | grep --color PED-7568 && echo "Test passed" || (echo "Test failed" && exit 1)
flatpak --user remove -y org.flatpak.Hello
