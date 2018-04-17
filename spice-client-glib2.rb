class SpiceClientGlib2 < Formula
  desc "Glib2 client/common libraries for SPICE"
  homepage "http://www.spice-space.org"
  url "https://www.spice-space.org/download/gtk/spice-gtk-0.34.tar.bz2"
  sha256 "e9720e01165f8451c9f3f58ad50e3afb990993b81cc2db86b3661b7ac5b976ee"

  depends_on "intltool" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  #depends_on "gobject-introspection" => :build
  depends_on "gettext" => :build

  depends_on "glib"
  depends_on "cairo"
  depends_on "jpeg"
  depends_on "openssl"
  depends_on "pixman"
  depends_on "spice-protocol"
  depends_on "usbredir"
  # TODO: audio

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--with-gtk=no",
                          "--enable-vala=no",
                          "--with-audio=no",
                          "--with-coroutine=gthread",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end

