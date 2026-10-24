class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.40/buildrules-cli-0.0.40-macos-arm64.tar.gz"
      sha256 "e65a79a6e05a0410d54873a7952c146fd6cdbb82aa882fe1e69dea8cb1f9520b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.40/buildrules-cli-0.0.40-linux-aarch64.tar.gz"
      sha256 "37c54145c37c4e282ac5ddd6737c275252d601368edae1004e8304a19c949853"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.40/buildrules-cli-0.0.40-linux-x86_64.tar.gz"
      sha256 "08f3de2866c9dc9ec235a166125e101ea06e1abd3f2c2595c7edbf0a5a549d2b"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
