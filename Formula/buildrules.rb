class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.10/buildrules-cli-0.0.10-macos-arm64.tar.gz"
      sha256 "1872de3f9a44944265c5b114c5d5dda1b2cffebab5bdef81d46816a4998d9f0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.10/buildrules-cli-0.0.10-linux-aarch64.tar.gz"
      sha256 "df621903bdb778f5fb7edea0411cd66bfca7d75cd57a4fec08a8470f0fb470ba"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.10/buildrules-cli-0.0.10-linux-x86_64.tar.gz"
      sha256 "e2bf3a2e2538fd3374da4d5c043ec44683aa823474519c0139fc453299b02ed4"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
