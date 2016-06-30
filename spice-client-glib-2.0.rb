class SpiceClientGlib2 < Formula
  desc "Glib2 client/common libraries for SPICE"
  homepage "http://www.spice-space.org"
  url "http://www.spice-space.org/download/gtk/spice-gtk-0.31.tar.bz2"
  sha256 "c72b4d202b1c0b71d6e24ce5caf914d6dddbcf4010d10db9c2d8e73af728c1ca"

  depends_on "gobject-introspection" => :build
  depends_on "intltool" => :build
  depends_on "libtool" => :build
  depends_on "gettext" => :build
  depends_on "pkg-config" => :build

  depends_on "jpeg"
  depends_on "glib"
  depends_on "openssl"
  depends_on "pixman"
  depends_on "spice-protocol"
  depends_on "usbredir"
  # TODO: audio

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--enable-introspection",
                          "--enable-vala=no",
                          "--with-audio=no",
                          "--with-coroutine=gthread",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end

