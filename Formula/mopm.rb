class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.83/mopm-0.0.83-macos-arm64.tar.gz"
      sha256 "f707288196c7256648a2023d45e5aa7e6577124e0eb6bb0cc36191041c2798a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.83/mopm-0.0.83-linux-aarch64.tar.gz"
      sha256 "33deb4e8b1fdc059b7cf774eb426611c9b4edf7770ce922cc5e47c79f4dba212"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.83/mopm-0.0.83-linux-x86_64.tar.gz"
      sha256 "fe87be9054cdde4ae78f2249760b3ee5b9d480a28e2524efdc7a77b15f016730"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
