pkgname=ucarch
pkgver=1.0
pkgrel=1
pkgdesc="system updater and orphaned cleaner"
arch=('any')
license=('GPL')
depends=('bash' 'libnewt')  # Specifica le dipendenze del pacchetto, se ce ne sono

package() {
   install -Dm755 uc-arch-v2.sh "$pkgdir/usr/bin/uc-arch-v2.sh"
}