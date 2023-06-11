pkgname=ucarch
pkgver=1.2
pkgrel=1
pkgdesc="System updater and orphaned cleaner"
arch=('any')
license=('GPL')
depends=('bash' 'libnewt')  # Specifica le dipendenze del pacchetto, se ce ne sono

package() {
   install -Dm755 ucarch "$pkgdir/usr/bin/ucarch"
}