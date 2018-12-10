class SpiceClientGlib2 < Formula
  desc "Glib2 client/common libraries for SPICE"
  homepage "http://www.spice-space.org"
  url "https://www.spice-space.org/download/gtk/spice-gtk-0.35.tar.bz2"
  sha256 "b4e6073de5125e2bdecdf1fbe7c9e8c4cabe9c85518889b42f72bf63c8ab9e86"

  depends_on "intltool" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
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
                          "--disable-opus",
                          "--with-coroutine=gthread",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end

