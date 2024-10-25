class Doas < Formula
  desc "Execute commands as another user"
  homepage "https://github.com/slicer69/doas"
  url "https://github.com/slicer69/doas/archive/refs/tags/6.3p12.tar.gz"
  version "6.3p12"
  sha256 "e4f37745345c12d4e0c8c03c8237791729cf047dbd7b2455f8de60e2f82ac1b0"
  license "BSD-2-Clause"
  head "https://github.com/slicer69/doas.git", branch: "master"


  def install
    system "make", "PREFIX=#{prefix}", "SYSCONFDIR=#{etc}", "install"
  end

  def caveats
    <<~EOS
      To complete the installation, run the following command manually:
        sudo cp /etc/pam.d/sudo /etc/pam.d/doas
    EOS
  end
end
