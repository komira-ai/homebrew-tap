class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.43/mopm-0.0.43-macos-arm64.tar.gz"
      sha256 "42844e40a9fbe6060f6d43e6b42de86c88336359ef280a33a6c0e3ca9a9e6565"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.43/mopm-0.0.43-linux-aarch64.tar.gz"
      sha256 "7f39cf2b4fece84fc31239416451758d24e7bb10e4734ec52af0d0125124efaa"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.43/mopm-0.0.43-linux-x86_64.tar.gz"
      sha256 "895f87d33badfe47d0f228d735c8a3e7b2a426de61d456e6ab952a1330accb78"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
