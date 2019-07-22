class SpiceClientGlib2 < Formula
  desc "Glib2 client/common libraries for SPICE"
  homepage "http://www.spice-space.org"
  url "https://www.spice-space.org/download/gtk/spice-gtk-0.37.tar.bz2"
  sha256 "1f28b706472ad391cda79a93fd7b4c7a03e84b88fc46ddb35dddbe323c923bb7"

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

