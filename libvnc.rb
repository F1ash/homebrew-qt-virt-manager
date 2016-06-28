class Libvnc < Formula
  desc "Cross-platform C libraries for easy implementation of VNC server or client"
  homepage "https://libvnc.github.io/"
  url "https://github.com/LibVNC/libvncserver.git",
  :revision => "15dd6470c552c7c8c112f0f78bde414b9f6a2714",
  :using => :git
  version "0.9.11rc" # random version

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "libtool" => :build
  depends_on "jpeg-turbo"
  depends_on "libpng"
  depends_on "openssl"
  depends_on "gnutls"
  depends_on "libgcrypt"
  depends_on "sdl"

  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
