class QtVirtManager < Formula
  desc "Qt5 Application for managing virtual machines"
  homepage "http://f1ash.github.io/qt-virt-manager/"
  url "https://github.com/F1ash/qt-virt-manager.git",
  :revision => "1a4a2ed6871af402b899ea97d106df5f5e66e1dc",
  :using => :git
  version "0.27.50.dev29.06" # random version
  #sha256 "???"

  depends_on "intltool" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "cmake" => :build

  depends_on "qt5"
  depends_on "qtermwidget"
  depends_on "glib"
  depends_on "libvnc"
  depends_on "libvirt-glib"
  depends_on "spice-protocol"
  depends_on "spice-gtk"
  depends_on "usbredir"
  #depends_on "gtk+3"
  depends_on :x11


  def install
    args = std_cmake_args
    args<<"-DBUILD_QT_VERSION=5"
    args<<"-DWITH_LIBCACARD=0"
    args<<"-DBUILD_TYPE=Release"
    args<<"-DUSE_SPICE_AUDIO=1"
    args<<"-DQT5_LIB_PATH=#{Formula["qt5"].prefix}"
    args<<"-DVNC_LIB_PATH=#{Formula["libvnc"].prefix}"
    args<<"-DSPICE_LIB_PATH=#{Formula["spice-protocol"].prefix}"
      mkdir "build" do
          system "cmake", "..", *args
          system "make", "install"
      end
  end

  def post_install
    # manual schema compile step
    system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
    # manual icon cache update step
    #system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "#{HOMEBREW_PREFIX}/share/icons/hicolor"
  end
end
