class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.21/buildrules-cli-0.0.21-macos-arm64.tar.gz"
      sha256 "6fe056455c1c1d293695f8ed1bdeabf29b1607a03936b27c13c5bd5668d433c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.21/buildrules-cli-0.0.21-linux-aarch64.tar.gz"
      sha256 "580b3172c635987c3c6f24d14ed55621d2c70729a1c747a7cb7287b75a70b535"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.21/buildrules-cli-0.0.21-linux-x86_64.tar.gz"
      sha256 "0e595ed9b5f7f01f0ab923ded5ce46ebba7a665ed58f46e11d8e75e8ba2483ee"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
