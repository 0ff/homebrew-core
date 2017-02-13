class Hackrf < Formula
  desc "Low cost software radio platform"
  homepage "https://github.com/mossmann/hackrf"
  url "https://github.com/mossmann/hackrf/archive/v2017.02.1.tar.gz"
  sha256 "7f84e61d07ab0ae4bd05912a4167cd7bc3cc2618d880bbd3a4579f65a2f1bbbf"
  head "https://github.com/mossmann/hackrf.git"

  bottle do
    cellar :any
    sha256 "f496bec0cd122e8d92fd74336196e4dab89c48e8dc6cccd86e3b9177f72936f6" => :sierra
    sha256 "7b0ed880b6f137fa9c8564654a1a63458c1b60f3108a4a8636dbae90eb392051" => :el_capitan
    sha256 "c7bdd9df9292a54c7596dbd491f2139c730b34c53292fe1821b8aec7acd64555" => :yosemite
    sha256 "fe5b6d365bce6c478514eb60db4523d16b4fa04c2863d407aa50f7ca4d77833e" => :mavericks
    sha256 "58c43dafc515a6a92b8553fa7a6edea406b02fe44164e60273c882a31bb11496" => :mountain_lion
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libusb"
  depends_on "fftw"

  def install
    cd "host" do
      system "cmake", ".", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    shell_output("#{bin}/hackrf_transfer", 1)
  end
end
