class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.75/buildrules-cli-0.0.75-macos-arm64.tar.gz"
      sha256 "4058f2393eac63f21d26a3af4898e568990dd7d905cca1c3ded13eeaaadfb317"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.75/buildrules-cli-0.0.75-linux-aarch64.tar.gz"
      sha256 "0126eb5bc9847a6237221654144190872ab9a0c67f1965a72fd0ed8c8472d6c9"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.75/buildrules-cli-0.0.75-linux-x86_64.tar.gz"
      sha256 "c4400471d98af414b1cfed6c7f955d2a1bfa28f2b86355d16cb4d8b7619bcc04"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
