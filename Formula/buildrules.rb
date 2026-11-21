class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.78/buildrules-cli-0.0.78-macos-arm64.tar.gz"
      sha256 "a365cf214b87b7da1d031d74c17b6a7341909843592e220aa8caa52b9861aaac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.78/buildrules-cli-0.0.78-linux-aarch64.tar.gz"
      sha256 "203b15c13e6099db3f5a874deeb5ac123ca6c4ea30a7762eb671096a0d990a04"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.78/buildrules-cli-0.0.78-linux-x86_64.tar.gz"
      sha256 "c7ef35fe6fab90a28cfc7a399561ecea5fdfdf85cb6e2a5deb1326a7f6dae820"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
