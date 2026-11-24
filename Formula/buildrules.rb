class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.85/buildrules-cli-0.0.85-macos-arm64.tar.gz"
      sha256 "b330ee45c7514e1a57c272e5c23284fe854164f8a6bea7ca765d3529328564a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.85/buildrules-cli-0.0.85-linux-aarch64.tar.gz"
      sha256 "570e225acaf1cc437629599aaf737d1bbbd630e10818bf1783c5b24d665a4a92"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.85/buildrules-cli-0.0.85-linux-x86_64.tar.gz"
      sha256 "80e417d74381e76133050d1135606840d11b0b0284576b41ebd3925c2ce83e99"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
