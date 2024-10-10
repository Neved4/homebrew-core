class Ykdl < Formula
  include Language::Python::Virtualenv

  desc "Video downloader that focus on China mainland video sites"
  homepage "https://github.com/SeaHOH/ykdl"
  url "https://files.pythonhosted.org/packages/f2/27/f4e7616a139c84a04edb7778db2b3cfb77348ab73020ff232b6551fa8bdd/ykdl-1.8.2.tar.gz"
  sha256 "c689b8e4bf303d1582e40d5039539a1a754f7cf897bce73ec57c7e874e354b19"
  license "MIT"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "cefcd4b7feee1ff7e156197e4a54a4b105eb5eb73039eba5ea56c423eba648da"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "ac74e40632118de8e802dae515a8179a20d27c5053a9c58d0ffaf408352ba4e5"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "deff9a5bc7f1bd56701715ef0ea1bb360279df66f53cbf6f252678af23f740f0"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "b98c04c184ca52d926b022f434b66d297b4d4a21acba1ad9a44b931a8b379255"
    sha256 cellar: :any_skip_relocation, sonoma:         "ccf9026d461d265992da9d43084cfdff410ebb8a0d6e56f2ff8b8957e2ec4d24"
    sha256 cellar: :any_skip_relocation, ventura:        "439dab5539656306042453e2a2d9827ab853856514a913b5a1cc7e9e5281c116"
    sha256 cellar: :any_skip_relocation, monterey:       "6088be7d6f4cd9e2bf4d897eb24f85364b350cc0f4cc267bc905f3c63f4af741"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "586d3eb95083a2bfdfbba2a180268220319f11489a2a2fad66a478119a5b0458"
  end

  depends_on "python@3.13"

  resource "jsengine" do
    url "https://files.pythonhosted.org/packages/bc/0a/1321515de90de02f9c98ac12dfa9763ae93d658ed662261758dc5e902986/jsengine-1.0.7.post1.tar.gz"
    sha256 "2d0d0dcb46d5cb621f21ea1686bdc26a7dc4775607fc85818dd524ba95e0a0fd"
  end

  resource "m3u8" do
    url "https://files.pythonhosted.org/packages/9b/a5/73697aaa99bb32b610adc1f11d46a0c0c370351292e9b271755084a145e6/m3u8-6.0.0.tar.gz"
    sha256 "7ade990a1667d7a653bcaf9413b16c3eb5cd618982ff46aaff57fe6d9fa9c0fd"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    "To merge video slides, run `brew install ffmpeg`."
  end

  test do
    video_url = "https://v.youku.com/v_show/id_XNTAwNjY3MjU3Mg==.html"
    output = shell_output("#{bin}/ykdl --info #{video_url} 2>&1", 1)
    assert_match "CRITICAL:YKDL", output
    assert_match version.to_s, shell_output("#{bin}/ykdl -h")
  end
end
