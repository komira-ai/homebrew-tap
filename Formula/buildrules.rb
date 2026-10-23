class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.32/buildrules-cli-0.0.32-macos-arm64.tar.gz"
      sha256 "cf3baf5137ebd26f80ea87ba5ed575719f26b5f718f30defe2f1a76865b8d384"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.32/buildrules-cli-0.0.32-linux-aarch64.tar.gz"
      sha256 "980c0198bd023ebcd09c70ec712d52695319c0d1ea278c4caceaa7627190ed91"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.32/buildrules-cli-0.0.32-linux-x86_64.tar.gz"
      sha256 "9a13c14f66228d5aca973a6479a3bd285ed4759c6f1e5cfd00a4a33a1928de87"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
