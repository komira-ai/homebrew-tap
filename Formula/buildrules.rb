class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.79/buildrules-cli-0.0.79-macos-arm64.tar.gz"
      sha256 "60771a0590038d63fc99b7cabeedb178ec665f2f93916f8b690885c319012dd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.79/buildrules-cli-0.0.79-linux-aarch64.tar.gz"
      sha256 "c08f0d5e26998c2a659f18488a3cedbe578a176341f4261d46c240b237738ab8"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.79/buildrules-cli-0.0.79-linux-x86_64.tar.gz"
      sha256 "1111319679a94c6607c62a4069c1596da00b8e51df94f37985911312dfe03051"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
