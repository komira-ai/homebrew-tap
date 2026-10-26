class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.46/buildrules-cli-0.0.46-macos-arm64.tar.gz"
      sha256 "9f9f0d12b4b9ab1b89c361da4f4b003d81d0e2382d5d81c02aecbff3a40e9638"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.46/buildrules-cli-0.0.46-linux-aarch64.tar.gz"
      sha256 "262ba7b676df2313b08e38c0a578f6c1ccb4c52379bb3f7822d249698493ae42"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.46/buildrules-cli-0.0.46-linux-x86_64.tar.gz"
      sha256 "b8d208ad9602488b21a18efde7de530a5492b1eb9e4622f3b7cb6b91f66f0dda"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
