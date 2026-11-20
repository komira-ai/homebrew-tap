class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.116/mopm-0.0.116-macos-arm64.tar.gz"
      sha256 "ad4628207d11b38fb884d86f3a99b7a608e2a626987df2f2a58bb32ccddeab4a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.116/mopm-0.0.116-linux-aarch64.tar.gz"
      sha256 "7ed97da62ca35709986f3d7dc2a6526c12cc78bb12498e51e100afe8692fb6dc"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.116/mopm-0.0.116-linux-x86_64.tar.gz"
      sha256 "6ad5713a6a768c087a7d2c806829727432fab9068580738bf3d865f663a4acd9"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
