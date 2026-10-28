class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.59/buildrules-cli-0.0.59-macos-arm64.tar.gz"
      sha256 "bf53e6ef72ca916f2e0a6de276261f4acbf0021eb7ae8af32cb6a0564c2fc976"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.59/buildrules-cli-0.0.59-linux-aarch64.tar.gz"
      sha256 "9fa1621119d8ae888b6b29369d4c25af76514747d658ae9b8252f69eabc90a69"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.59/buildrules-cli-0.0.59-linux-x86_64.tar.gz"
      sha256 "d3976cda0f768d64e986ad3ec06e253771240a0c92c6dfca415e913a07debed9"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
