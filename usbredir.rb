class Usbredir < Formula
  desc "USB traffic redirection library"
  homepage "https://www.spice-space.org"
  url "https://www.spice-space.org/download/usbredir/usbredir-0.8.0.tar.bz2"
  sha256 "87bc9c5a81c982517a1bec70dc8d22e15ae197847643d58f20c0ced3c38c5e00"

  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  depends_on "libusb"

  def install
    system "./configure", "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end

