class SpiceProtocol < Formula
  desc "Headers for SPICE protocol"
  homepage "https://www.spice-space.org/"
  url "https://www.spice-space.org/download/releases/spice-protocol-0.14.0.tar.bz2"
  sha256 "b6a4aa1ca32668790b45a494bbd000e9d05797b391d5a5d4b91adf1118216eac"

  def install
    system "./configure", "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end

